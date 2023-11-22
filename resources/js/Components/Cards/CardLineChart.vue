<template>
  <div class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded bg-white shadow-xl"
    :key="selectedWeek">
    <div class="rounded-t mb-0 px-4 py-3 bg-transparent">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full max-w-full flex-grow flex-1">
          <h6 class="uppercase text-blueGray-700 mb-1 text-xs font-semibold">
            Overview
          </h6>
          <h2 class="text-blueGray-700 text-xl font-semibold">
            Vehicle Usages
          </h2>

        </div>
        <div class="w-full lg:w-3/12 px-4">
          <div class="relative w-full mb-3">
            <label class="block uppercase text-blueGray-700 text-xs font-bold mb-2" htmlFor="grid-password">
              Select Weeks
            </label>
            <select id="weeks" name="weeks" v-model="selectedWeek" :onchange="changeWeek"
              class="border border-emerald-600 px-1 py-1 placeholder-blueGray-300 text-blue-950 bg-white  rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

              <option value="1">This Week</option>
              <option value="2">1 Week Ago</option>
              <option value="3">2 Week Ago</option>
              <option value="4">3 Week Ago</option>

            </select>
          </div>
        </div>
      </div>
    </div>
    <div class="p-4 flex-auto">
      <!-- Chart -->
      <div class="relative h-350-px">
        <canvas id="line-chart"></canvas>
      </div>
    </div>
  </div>
</template>
<script setup>
import axios from "axios";
import { Chart } from "chart.js/auto";

import { onMounted, ref } from "vue";

const selectedWeek = ref(1)

const changeWeek = () => {
  axios.get('/usage-data/' + selectedWeek.value)
    .then(function (responses) {
      buildChart(responses.data);
    })
}
onMounted(() => {
  axios.get('/usage-data/1')
    .then(function (responses) {
      buildChart(responses.data);
    })
})



const buildChart = (datas) => {
  var config = {
    type: "line",
    data: {
      labels: datas.map(entry => entry.date),
      datasets: [
        {
          label: 'Usage Count',
          backgroundColor: "#299569",
          borderColor: "#299569",
          data: datas.map(entry => entry.total_count),
          fill: false,
        },
      ],
    },
    options: {
      maintainAspectRatio: false,
      responsive: true,
      bezierCurve: true,
      title: {
        display: false,
        text: "Vehicle Usage",
        fontColor: "white",
      },
      legend: {
        labels: {
          fontColor: "white",
        },
        align: "end",
        position: "bottom",
      },
      tooltips: {
        mode: "index",
        intersect: false,
      },
      hover: {
        mode: "nearest",
        intersect: true,
      },
    },
  };
  var ctx = document.getElementById("line-chart").getContext("2d");
  window.myLine = new Chart(ctx, config);
}


</script>
