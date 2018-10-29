<!-- Input from https://developers.google.com/chart/interactive/docs/gallery/combochart -->

<html>
    <head>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_GOES_HERE&libraries=visualization&callback=init">
        </script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script>
            google.charts.load("visualization", "1", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(init);
            var M, C;
            function init() {
                document.getElementById('go').onclick = function () {
                    var csv = document.getElementById('input').value;
                    // split on newlines
                    var csvData = csv.split('\n');
                    var row;
                    var rowarray;
                    var m, c;
                    var xyArray = [];
                    var xArray = [];
                    var yArray = [];

                    var x, y, xy_sum = 0, x_sum = 0, y_sum = 0, x2_sum = 0, y2_sum = 0;
                    var dataArray = [];
                    for (var i = 0; i < csvData.length; i++) {
                        // strip whitespace adjacent to commas, start of line, or end of line
                        row = csvData[i].replace(/(^\s|(,)\s|\s(,)|\s$)/g, '$2');

                        if (row.length > 0) {
                            rowarray = row.split(',');
                            for (var j = 0; j < rowarray.length; j++)
                            {
                                // if the string value equals the parseFloat of the string, then it is most likely a number
                                // so translate to number, otherwise leave as string
                                if (rowarray[j] == parseFloat(rowarray[j])) {
                                    rowarray[j] = parseFloat(rowarray[j]);

                                    x = rowarray[0];
                                    xArray[i] = x;
                                    yArray[i] = y;
                                    y = parseInt(rowarray[1]);
                                    xy_sum += x * y;
                                    x_sum += x;
                                    y_sum += y;
                                    x2_sum += x * x;
                                    y2_sum += y * y;
                                }
                            }
                        }

                        dataArray.push(rowarray);
                    }
                    xy_sum = xy_sum / 2;
                    x_sum = x_sum / 2;
                    y_sum = y_sum / 2;
                    x2_sum = x2_sum / 2;
                    y2_sum = y2_sum / 2;
                    var n = csvData.length - 1;
                    m = ((n * xy_sum) - (x_sum * y_sum)) / ((n * x2_sum) - (x_sum * x_sum));
                    c = (y_sum - m * x_sum) / n;

                    document.getElementById("m").value = m;
                    document.getElementById("c").value = c;
                    M = m;
                    C = c;
                    xyArray[0] = ["x", "Y", "Linear Regression Line"];
                    for (var i = 1; i <= n; i++)
                    {
                        xyArray[i] = [xArray[i], yArray[i], m * xArray[i] + c];
                    }


                    var data = google.visualization.arrayToDataTable(xyArray);

                    var options = {
                        height: 300,
                        width: 500,
                        hAxis: {
                            title: data.getColumnLabel(0)
                        },
                        vAxis: {
                            title: data.getColumnLabel(1)
                        }
                        ,
                        pointSize: 10,
                        series: {
                            0: {
                                lineWidth: 0,
                                pointSize: 5,
                                visibleInLegend: true

                            },
                            1: {
                                pointSize: 0
                            }
                        }
                    }

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);

                };
            }

            function calc()
            {
                var x = parseInt(document.getElementById("x").value);
                var ans = M * x + C;
                document.getElementById("y_val").value = ans;

            }

        </script>
    </head>

    <body>
        Enter data separated by commas:
        <textarea id="input" style="display: block; height: 400px; width: 300px;">
        x, y
        1980,90
        1985,220
        1990,250
        1995,340
        2000,375
        2005,450
        2010,590
        </textarea>
        <input type="button" value="Display Chart" id="go" />
        <div id="chart_div" style = "width:1000px" ></div>

        <div id="mandc">
            For these values,
            m = <input type="text" id = "m" name="m" value="" />
            c = <input type="text" id = "c" name="c" value="" />
        </div>


        <div id="predict">
            Enter the value of x,
            x = <input type="text" id = "x" name="x" value="" />
            y = <input type="text" id = "y_val" name="y" value="" />
            <input type="submit" value="Calculate value" id="calc" onclick="calc()"/>
        </div>
    </body>
</html>
