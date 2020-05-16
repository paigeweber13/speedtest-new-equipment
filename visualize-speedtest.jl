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
    append!(data, [CSV.File(file)])
  end

  file_names, data
end

function plot_data()
end
