<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w" clstag="homepage|keycount|home2013|37a">
	<div id="service-2013" style="bottom: 15px; width: 100%; height: 22px; text-align: center; font-size: 20px;
         line-height: 20px; color: #45a9ef; position: absolute;">
		dolphin
	</div>
</div>

<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/dolphin.js" charset="utf-8"></script>
<script type="text/javascript"> 
(function(){
	var _searchValue = "${query}";
	
	$("#key").val(_searchValue).bind("focus",function(){if (this.value==B){this.value="";this.style.color="#333"}}).bind("blur",function(){if (!this.value){this.value=B;this.style.color="#999"}});
})();
</script>