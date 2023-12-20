<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<style>
        .chartContainer {
            display: flex;
            flex-wrap: wrap;
        }

        .chartBox1, .chartBox2 {
            width: 350px;
            height: 300px;
            background-color : lightgray;
  			border-radius: 30px;
            margin: 5px;
        }
    </style>
</head>

<body>
    <jsp:include page="../side.jsp"></jsp:include>
	${string }
    <div class="chartContainer">
        <div class="chartBox1">
        	<div class="coceanFriends"></div>
        </div>
        <div class="chartBox1"></div>
        <div class="chartBox1"></div>

        <div class="chartBox2"></div>
        <div class="chartBox2"></div>
        <div class="chartBox2"></div>
    </div>
</body>
<script>
const config = {
		  type: 'bar',
		  data: data,
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      title: {
		        display: true,
		        text: 'Chart.js Bar Chart'
		      }
		    }
		  },
		};
		
const DATA_COUNT = 7;
const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};

const labels = Utils.months({count: 7});
const data = {
  labels: labels,
  datasets: [
    {
      label: 'Fully Rounded',
      data: Utils.numbers(NUMBER_CFG),
      borderColor: Utils.CHART_COLORS.red,
      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
      borderWidth: 2,
      borderRadius: Number.MAX_VALUE,
      borderSkipped: false,
    },
    {
      label: 'Small Radius',
      data: Utils.numbers(NUMBER_CFG),
      borderColor: Utils.CHART_COLORS.blue,
      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.blue, 0.5),
      borderWidth: 2,
      borderRadius: 5,
      borderSkipped: false,
    }
  ]
};

const actions = [
	  {
	    name: 'Randomize',
	    handler(chart) {
	      chart.data.datasets.forEach(dataset => {
	        dataset.data = Utils.numbers({count: chart.data.labels.length, min: -100, max: 100});
	      });
	      chart.update();
	    }
	  },
	];
</script>
</html>