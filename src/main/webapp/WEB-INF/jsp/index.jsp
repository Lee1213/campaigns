<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

  <script src="../js/jquery-1.11.3.min.js"></script>
  <title></title>
  <style>
     * {
      margin: 0;
      padding: 0;
      position: relative;
      text-align: center; //vary important
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      font-family: 'Arial', sans-serif;
      -webkit-font-smoothing: antialiased;
    }
    .clearfix:before,
    .clearfix:after {
      display : table;
      content : " ";
    }
    .clearfix:after {
      clear : both;
    }
    .head {
      margin-top: 30px;
      height: 40px;
      text-align: center;
      display: inline-block;
      
    }
    .input {
      height: 40px;
      width:100px;
      margin: 0 20px;
      display: inline-block;
    }
    .input input {
      font-size: 16px;
      height: 40px;
      width:100px;
      border-radius: 10px;
      border-color:"#000";
    }
    .button {
      margin: 0 20px;
      box-sizing: border-box;
      font-family: 'Arial', sans-serif;
      background-color: #4ba3e0;
      border-radius: 30px;
      font-size: 16px;
      line-height: 32px;
      color: #ffffff;
      width: 120px;
      height: 40px;
      padding: 5px 0;
      display: inline-block;
    }
    .chart {
      margin-top:30px;
    }
    .content {
      margin: 10px 100px;
      background-color: #4ba3e0;
      display: inline-block;
    }
    .block {
      width: 125px;
      heighr: 70px;
      font-size: 35px;
      display: inline-block;
      padding: 10px 10px;
      align-content: center;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="head clearfix">
      <div class="input">
        <input type="text" placeholder="1" id="userid" />
      </div>
      <div class="button" id="user"></div>
  </div>
  <div class="head clearfix">
      <div class="input" style="width:300px">
        <input type="text" placeholder="电影名" style="width:300px" id="moviename" />
      </div>
      <div class="button" id="movie">获取电影</div>
  </div>
  
  <div id="chart" class="chart" style="width: 100%;height: 450px;">
      <div class="circle clearfix"></div>
  </div>
  
  <div class="content">
    <div class="block">总计：</div>
    <div class="block" id="total"></div>
  </div>
  <div class="content">
    <div class="block">DR：</div>
    <div class="block" id="dr"></div>
  </div>
  <div class="content" style="width:1700px;">
    <div class="block">
        <div class="block">评分：</div>
        <div class="block">分布：</div>
    </div>
    <div class="block">
        <div class="block">1分</div>
        <div class="block" id="rate1"></div>
    </div>
    <div class="block">
        <div class="block">2分</div>
        <div class="block" id="rate2"></div>
    </div>
    <div class="block">
        <div class="block">3分</div>
        <div class="block" id="rate3"></div>
    </div>
    <div class="block">
        <div class="block">4分</div>
        <div class="block" id="rate4"></div>
    </div>
    <div class="block">
        <div class="block">5分</div>
        <div class="block" id="rate5"></div>
    </div>
  </div>
  
  <div class="content">
    <div class="block">标题：</div>
    <div class="block" id="title"></div>
  </div>
  <div class="content">
    <div class="block">类别：</div>
    <div class="block" id="genres"></div>
  </div>
  <div class="content">
    <div class="block">评分：</div>
    <div class="block" id="rate"></div>
  </div>
  <div class="content">
    <div class="block">年份：</div>
    <div class="block" id="year"></div>
  </div>
  
</div>
<script type="text/javascript" src="../js/amcharts.js"></script>
<script type="text/javascript" src="../js/serial.js"></script>
<script type="text/javascript">
  $( document ).ready( function () {
      var chartData = [], chart, dataArray = [],
      $userButton = $( '#user' ),
      $userId = $( '#userid' ),
      $total = $( '#total' ),
      $dr = $( '#dr' );
      color = ["#ffffff", "#000099", "#00cccc", "#009900", "#ffcc00", "#ff00ff"];
      
      //默认显示用户
      ajax( 1 );
      
      //输入用户id
      $userButton
        .text( '请求' )
        .on('click', function(){
            ajax( $userId.val() );
         });
      
      //获取电影详细信息
      $( '#movie' ).on( 'click', function() {
          getMovieInfo( $( '#moviename' ).val() );
      } );
          
      //Ajax请求函数
      function ajaxUtil ( params, successCallback, errorCallback ) {
        var opt,
          DEFAULT = {
            showLoad: true
          };
        opt = $.extend(
          {},
          DEFAULT,
          params,
          {
            success: function ( data ) {
              if ( data['message'] && !params.hideMessage ) {
                if ( data.code==0 ){
                  successCallback && successCallback( data );
                } else {
                  dialogUtil.addDialog( {
                    mode: 0,
                    message: data['message'],
                    onOk: function () {
                      checkLoginState( data.code );
                      successCallback && successCallback( data );
                    }
                  } );
                }
              } else {
                successCallback && successCallback( data );
              }
            },
            error: function ( data ) {
              console.log( data );
            }
          }
        );
        $.ajax( opt );
      }
      
      //请求用户的评分信息
      function ajax( userid ){
          console.log( userid );
          ajaxUtil(
                  {
                    url: 'http://localhost:12551/cxtd/user/rate?userid=' + parseInt( userid )
                  },
                  function ( response ) {
                      var data = JSON.parse( response );
                      if( !data ){alert("该用户无数据！");}
                      var feature = data.feature[0];
                      var rating = data.rating;
                      console.log( rating );
                      
                      $( '#total' ).text( feature.total );
                      $( '#dr' ).text( feature.dr );
                      for( var r=1; r<6; r++ ){
                          $( '#rate' + r ).text( feature['rate'+r] );
                      }
                      chartData.length = 0;
                      
                      for(var i=0; i < rating.length; i++){
                         var item = rating[i];
                         var time = item.time;
                         var dates = time.replace('/', '-').replace('/', '-').split(' ');
                         chartData.push( {
                            color: color[parseInt( item.rate )],
                            rate: item.rate,
                            date: dates[0],
                            time: dates[1],
                            movie: item.movie,
                            movieType: item.movieType
                          } );
                      };
                      chart.validateData();
                  }
              );
      }
      
      //从豆瓣网获取电影的详细信息
      function getMovieInfo( movieName ){
          $.ajax({
             url: 'https://api.douban.com/v2/movie/search?q=' + movieName,
             dataType : "jsonp",
             type : "GET",
             success: function ( data ) {
                 var movies = data.subjects;
                 $( '#title' ).text( '' );
                 $( '#genres' ).text( '' );
                 $( '#year' ).text( '' );
                 
                 movies.forEach( function(item, i) {
                    if ( item.original_title.toUpperCase() == movieName.toUpperCase() || item.title == movieName ) {
                        console.log( item );
                        var genres = "";
                        for ( var j = 0; j < item.genres.length; j++ ){
                            genres = genres + item.genres[j] + '|' ;
                        }
                        $( '#rate' ).text( item.rating.average );
                        $( '#title' ).text( item.title );
                        $( '#genres' ).text( genres );
                        $( '#year' ).text( item.year );
                        movies.length = 0;
                        return;
                    }
                    return;
                 });
             }
          });
      }
     
      makeChart();
      //制作图表
      function makeChart () {
        var graph;
        // SERIAL CHART
        chart = new AmCharts.AmSerialChart();
        chart.dataProvider = chartData;
        chart.marginLeft = 10;
        chart.categoryField = "date";
        chart.dataDateFormat = "yyyy-MM-dd";
        chart.maxZoomFactor = 1;
        chart.zoomOutButtonColor = "#000000";
        chart.zoomOutText = "";
        //chart.zoomOutText = "全部显示";

        // AXES
        // category
        var categoryAxis = chart.categoryAxis;
        //categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
        categoryAxis.minPeriod = "mm"; // our data is yearly, so we set minPeriod to YYYY
        categoryAxis.axisColor = "#000000";
        categoryAxis.axisThickness = 2;
        categoryAxis.color = "#000000";
        categoryAxis.gridColor = "#000000";
        categoryAxis.gridThickness = 2;
        categoryAxis.tickLength = 0;
        categoryAxis.offset = 0;
        categoryAxis.fontSize = 8;
        categoryAxis.equalSpacing = true;
        categoryAxis.labelRotation = 75;

        // value
        var valueAxis = new AmCharts.ValueAxis();
        valueAxis.axisColor = "#000000";
        valueAxis.axisThickness = 2;
        valueAxis.color = "#000000";
        valueAxis.gridColor = "#000000";
        valueAxis.gridThickness = 2;
        valueAxis.tickLength = 0;
        valueAxis.offset = 10;
        valueAxis.fontSize = 26;
        valueAxis.integersOnly = true;
        // valueAxis.guides = [{
        //    "fillAlpha": 0.3,
        //    "fillColor": "#5ceb2a",
        //    "lineAlpha": 1,
        //    "lineThickness": 2,
        //    "lineColor": "#98c958",
        //    "toValue": parseFloat( responseRecords[0].monitoring_max_num ),
        //    "value": parseFloat( responseRecords[0].monitoring_min_num )
        // }];
        chart.addValueAxis( valueAxis );

        // GRAPH
        graph = new AmCharts.AmGraph();
        graph.colorField = "color";
        graph.fillAlphas = 0.8;
        graph.type = "column"; // this line makes the graph smoothed line.
        graph.lineColor = "#f49941";
        graph.negativeLineColor = "#000000"; // this line makes the graph to change color when it drops below 0
        graph.lineThickness = 1;
        graph.valueField = "rate";
        graph.balloonColor = "#000000";
        graph.balloonText = "电影：[[movie]]<br/>评分：[[rate]]<br/>时间:[[time]]";
        graph.fixedColumnWidth = 20;
        chart.addGraph( graph );

        //LEGEND
        var legend = new AmCharts.AmLegend();
        // legend.horizontalGap = 10;
        legend.align = "center";
        legend.color = "#000000";
        legend.position = "absolute";
        legend.data = [{ title: "1分", color: "#000099" },
                       { title: "2分", color: "#00cccc" },
                       { title: "3分", color: "#009900" },
                       { title: "4分", color: "#ffcc00" },
                       { title: "5分", color: "#ff00ff" }];
        legend.fontSize = 24;
        chart.addLegend( legend );


        //Balloon
        var balloon = new AmCharts.AmBalloon();
        balloon.fadeOutDuration = 2;
        chart.balloon = balloon;

        // CURSOR
        var chartCursor = new AmCharts.ChartCursor();
        chartCursor.cursorAlpha = 0;
        chartCursor.cursorPosition = "mouse";
        chartCursor.categoryBalloonDateFormat = "HH:NN";
        chartCursor.zoomable = true;
        chartCursor.pan = true;
        chartCursor.valueZoomable = false;
        chartCursor.categoryBalloonEnabled = false;
        chart.addChartCursor( chartCursor );

        chart.addListener( 'dataUpdated', function () {
          chart.zoomToIndexes( 0, 29 );
        } );
        chart.balloon.fontSize = 18;
        chart.creditsPosition = "bottom-right";

        // WRITE
        chart.write( "chart" );
      }
  });
</script>
</body>
</html>