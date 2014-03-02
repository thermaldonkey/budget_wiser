# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  $("#start_date_picker").datepicker(
    todayHighlight: true,
  ).on('changeDate', (e) ->
    $("#pay_period_start_date").val(e.format('yyyy-mm-dd'))
  )

  $("#end_date_picker").datepicker(
    todayHighlight: true
  ).on('changeDate', (e) ->
    $("#pay_period_end_date").val(e.format('yyyy-mm-dd'))
  )

  widthOfProgressDiv = document.getElementById("progress").offsetWidth
  allowance = document.getElementById("pay_period_allowance").value
  balanceString = document.getElementById("pay_period_balance").innerText
  balance = parseFloat(balanceString.split(" ")[1])
  percentageSpent = 1 - (balance / allowance)
  progressBar = document.getElementById("balance_progress")
  percentProgressed = (Math.floor(percentageSpent * 100) + "%")
  progressBar.style.width = percentProgressed
  progressBar.innerText = percentProgressed

