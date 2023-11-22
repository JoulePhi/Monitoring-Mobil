<template>
  <!-- Header -->
  <div class="relative bg-emerald-600 md:pt-32 pb-32 pt-12">
    <div class="px-4 md:px-10 mx-auto w-full">
      <div>
        <!-- Card stats -->
        <div class="flex flex-wrap">
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats statSubtitle="Users" :statTitle="userCount" statArrow="up" statPercent=""
              statPercentColor="text-emerald-500" statDescripiron="Total Users" statIconName="🧑"
              statIconColor="bg-red-500" />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats statSubtitle="Drivers" :statTitle="drivers.total" statArrow="down"
              :statPercent="drivers.available" statPercentColor="text-red-500" statDescripiron="Available"
              statIconName="☸" statIconColor="bg-orange-500" />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats statSubtitle="Vehicles" :statTitle="vehicles.total" statArrow="down"
              :statPercent="vehicles.available" statPercentColor="text-orange-500" statDescripiron="Available"
              statIconName="🚗" statIconColor="bg-pink-500" />
          </div>
          <div class="w-full lg:w-6/12 xl:w-3/12 px-4">
            <card-stats statSubtitle="Fuel" :statTitle='fuel + " L"' statArrow="up" statPercent=""
              statPercentColor="text-emerald-500" statDescripiron="Total Fuel Consumption" statIconName="⛽"
              statIconColor="bg-emerald-500" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import CardStats from "@/Components/Cards/CardStats.vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage()

const userCount = page.props.stats.users;
const drivers = page.props.stats.drivers;
const vehicles = page.props.stats.vehicles;
const fuel = page.props.stats.fuel;
</script>
