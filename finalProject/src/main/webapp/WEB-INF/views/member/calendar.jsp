<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'arial', sans-serif;
  background: #eeeeee;
}
.wrapper {
  max-width: 560px;
  margin: 100px auto;
}
label {
  position: relative;
  display: block;
}
label > input {
  position: relative;
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #9e9e9e;
  border-radius: 0;
  outline: none;
  height: 45px;
  width: 100%;
  font-size: 16px;
  margin: 0 0 30px 0;
  padding: 0;
  box-shadow: none;
  box-sizing: content-box;
  transition: all .3s;
}
label > input:valid + span {
  transform: translateY(-25px) scale(0.8);
  transform-origin: 0;
}
label > input:valid {
  border-bottom: 1px solid #3F51B5;
  box-shadow: 0 1px 0 0 #3F51B5;
}
label > span {
  color: #9e9e9e;
  position: absolute;
  top: 0;
  left: 0;
  font-size: 16px;
  cursor: text;
  transition: .2s ease-out;
}
label > input:focus + span {
  transform: translateY(-25px) scale(0.8);
  transform-origin: 0;
  color: #3F51B5;
}
label > input:focus {
  border-bottom: 1px solid #3F51B5;
  box-shadow: 0 1px 0 0 #3F51B5;
}




/*Bootstrap Calendar*/
.datepicker {
    border-radius: 0;
    padding: 0;
}
.datepicker-days table thead, .datepicker-days table tbody, .datepicker-days table tfoot {
    padding: 10px;
    display: list-item;
}
.datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
    background: #3546b3;
    color: #ffffff;
    border-radius: 0;
}
.datepicker-days table thead tr:nth-child(2n+0) td, .datepicker-days table thead tr:nth-child(2n+0) th {
    border-radius: 3px;
}
.datepicker-days table thead tr:nth-child(3n+0) {
    text-transform: uppercase;
    font-weight: 300 !important;
    font-size: 12px;
    color: rgba(255, 255, 255, 0.7);
}
.table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
    padding: 11px 13px;
}
.datepicker-months table thead td, .datepicker-months table thead th, .datepicker-years table thead td, .datepicker-years table thead th, .datepicker-decades table thead td, .datepicker-decades table thead th, .datepicker-centuries table thead td, .datepicker-centuries table thead th {
    border-radius: 0;
}
.datepicker td, .datepicker th {
    border-radius: 50%;
    padding: 0 12px;
}
.datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
    background: #3546b3;
    color: #ffffff;
    border-radius: 0;
}
.datepicker table tr td.active, .datepicker table tr td.active:hover, .datepicker table tr td.active.disabled, .datepicker table tr td.active.disabled:hover {
    background-image: none;
}
.datepicker .prev, .datepicker .next {
    color: rgba(255, 255, 255, 0.5);
    transition: 0.3s;
    width: 37px;
    height: 37px;
}
.datepicker .prev:hover, .datepicker .next:hover {
    background: transparent;
    color: rgba(255, 255, 255, 0.99);
    font-size: 21px;
}
.datepicker .datepicker-switch {
    font-size: 24px;
    font-weight: 400;
    transition: 0.3s;
}
.datepicker .datepicker-switch:hover {
    color: rgba(255, 255, 255, 0.7);
    background: transparent;
}
.datepicker table tr td span {
    border-radius: 2px;
    margin: 3%;
    width: 27%;
}
.datepicker table tr td span.active, .datepicker table tr td span.active:hover, .datepicker table tr td span.active.disabled, .datepicker table tr td span.active.disabled:hover {
  background-color: #3546b3;
  background-image: none;
}
.dropdown-menu {
    border: 1px solid rgba(0,0,0,.1);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}
.datepicker-dropdown.datepicker-orient-top:before {
    border-top: 7px solid rgba(0,0,0,.1);
}
</style>
<script>

$('.dateselect').datepicker({
    format: 'mm/dd/yyyy',
    // startDate: '-3d'
});

 $('.dateselect2').datepicker({
     format: 'mm/dd/yyyy',
     autoclose:true,
     todayHighlidht: true,
 }).on("hide", function(){
   if ($)
 }

</script>
</head>
<body>

<div class="wrapper">

  <label>
    <input type="text" required="required"/>
    <span>Name</span>
  </label>
  
  <label>
<!--     <input data-provide="datepicker" required="required"> -->
    <input type="text" class="dateselect" required="required"/>
    <span>Date</span>
  </label>
  
  <label>
    <input type="text" class="dateselect2" required="required"/>
    <span>Date</span>
  </label>
  
</div>
</body>
</html>