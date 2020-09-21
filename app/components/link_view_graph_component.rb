class LinkViewGraphComponent < ViewComponent::Base
  COLOR_GRAY_300 = "#E3EBF6"
  COLOR_GRAY_600 = "#95AAC9"

  def initialize(visits:, uniques:)
    @visits = visits.sort.map { |date, count|
      [date.stamp("Jan 01"), count]
    }.to_h

    @unique_visits = uniques.sort.map { |date, count|
      [date.stamp("Jan 01"), count]
    }.to_h
  end

  def show_chart
    column_chart data, stacked: true, legend: false, library: library_options
  end

  def data
    [
      {name: "Visits", data: @visits, dataset: dataset_options},
      {name: "Uniques", data: @unique_visits, dataset: unique_visits_options}
    ]
  end

  def library_options
    {
      scales: {
        xAxes: [
          {gridLines: {
            drawBorder: false,
            drawOnChartArea: false,
            drawTicks: false
          },
           ticks: {
             padding: 20
           }}
        ],
        yAxes: [
          {
            gridLines: {
              borderDash: [2],
              borderDashOffset: [2],
              color: COLOR_GRAY_300,
              drawBorder: false,
              drawTicks: false,
              zeroLineColor: COLOR_GRAY_300,
              zeroLineBorderDash: [2],
              zeroLineBorderDashOffset: [2]
            },
            ticks: {
              beginAtZero: true,
              padding: 10,
              stepSize: 10
            }
          }
        ]
      }
    }
  end

  def dataset_options
    {
      backgroundColor: "#2C7BE5",
      borderColor: "#2C7BE5"
    }
  end

  def unique_visits_options
    {
      backgroundColor: "#A6C5F7",
      borderColor: "#A6C5F7"
    }
  end
end
