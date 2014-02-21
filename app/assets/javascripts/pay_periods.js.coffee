# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  widthOfProgressDiv = document.getElementById("progress").offsetWidth
  netIncome = document.getElementById("pay_period_net_income").value
  balanceString = document.getElementById("pay_period_balance").innerText
  balance = parseFloat(balanceString.split(" ")[1])
  percentageSpent = 1 - (balance / netIncome)
  progressBar = document.getElementById("balance_progress")
  percentProgressed = (Math.floor(percentageSpent * 100) + "%")
  progressBar.style.width = percentProgressed
  progressBar.innerText = percentProgressed
