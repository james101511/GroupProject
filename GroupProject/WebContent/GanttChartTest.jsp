<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery_ui_1.8.4.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.ganttView.css" />
	<style type="text/css">
		body {
			font-family: tahoma, verdana, helvetica;
			font-size: 0.8em;
			padding: 50px;
		}
	</style>
	<title>Group Project Gantt Chart</title>
</head>
<body>

	<div id="ganttChart"></div>
	<br/><br/>
	<div id="eventMessage"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_1.4.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/date.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_ui_1.8.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ganttView.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/data.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#ganttChart").ganttView({ 
				data: ganttData,
				slideWidth: 1500,
				behavior: {
					onClick: function (data) { 
						var msg = "You clicked on an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
						$("#eventMessage").text(msg);
					},
					onResize: function (data) { 
						var msg = "You resized an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
						$("#eventMessage").text(msg);
					},
					onDrag: function (data) { 
						var msg = "You dragged an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
						$("#eventMessage").text(msg);
					}
				}
			});
			
			// $("#ganttChart").ganttView("setSlideWidth", 600);
		});
	</script>

</body>
</html>
