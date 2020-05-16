using CSV
using Plots

function load_data()
  DATA_DIR = "./data/"

  println("exploring ", DATA_DIR, " for files")
  file_names = readdir(DATA_DIR)
  for i = 1:size(file_names)[1]
    file_names[i] = DATA_DIR * file_names[i]
  end

  println("removing anything without the .csv extension")
  things_to_delete = []
  for i = 1:size(file_names)[1]
    if (!occursin("csv", file_names[i]))
      append!(things_to_delete, [i])
    end
  end

  for i = size(things_to_delete)[1]:-1:1
    deleteat!(file_names, things_to_delete[i])
  end

  data = []
  for file in file_names
    println("loading data from ", file)
    append!(data, [CSV.File(file; normalizenames=true)])
  end
  println("finished!")
  println()

  file_names, data
end

bytes_to_mbits(x) = x * 1e-6 * 8

function convert_speedtest_up_down_to_mbits_per_s!(data)
  metrics = [:download, :upload]

  for i = 1:size(data)[1]
    for metric in metrics
      metric_data = getproperty(data[i], metric)
      println(metric_data)
      converted_data = bytes_to_mbits.(metric_data)
      println(converted_data)
      println(data[i])

      # doesn't work
      # setproperty!(data[i], metric, converted_data)
    end
  end

  data
end

function plot_data(file_names, 
    data, 
    metrics=[:latency, :jitter, :download, :upload]
  )

  x = []
  for i = 1:size(file_names)[1]
    m = match(r".*\/(.*)\.csv", file_names[i])
    for metric in metrics
      for entry in getproperty(data[i], metric)
        append!(x, [string(m[1], "_", metric)])
      end
    end
  end

  y = []
  for single_test_data in data
    for metric in metrics
      if metric == :download || metric == :upload
        append!(y, bytes_to_mbits.(getproperty(single_test_data, metric)))
      else
        append!(y, getproperty(single_test_data, metric))
      end
    end
  end

  # set backend
  gr()

  println(x)
  println(y)

  # create plot
  plot(x, y,
    seriestype = :scatter, 
    title = "Internet speeds after different upgrades",
    xlabel = "Upgrade and metric",
    ylabel = "Value",
    dpi = 700,
    ylims = (0.0, 100),
    legend = false,
    # markersize = 1,
    # markeralpha = 1,
    # markeralpha = 0.1,
    # markerstrokestyle = :dot,
    # markerstrokecolor = :blue,
    # markerstrokewidth = 0,
    markerfillcolor = :blue,
  )
  
  savefig("plots/result.png")
end
