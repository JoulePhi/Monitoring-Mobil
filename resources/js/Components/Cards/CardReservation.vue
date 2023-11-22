<template>
  <div class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-blueGray-100 border-0">
    <div class="rounded-t bg-white mb-0 px-6 py-6">
      <div class="text-center flex justify-between">
        <h6 class="text-blueGray-700 text-xl font-bold">Reservation</h6>

      </div>
    </div>
    <div class="flex-auto px-4 lg:px-10 py-10 pt-0 z-0">
      <form method="post" :action="route('reservation.reserve')">
        <input type="hidden" name="_token" :value="csrf">
        <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
          Select User
        </h6>
        <div class="w-full lg:w-12/12 px-4">
          <div class="relative w-full mb-3">
            <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
              User
            </label>

            <select id="user" name="user"
              class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

              <option value="" selected>Select User</option>
              <option :value="user.id" v-for="user in users">{{ user.name }}</option>

            </select>
            <span class="text-red-600" v-if="errors?.user">{{ errors.user }}</span>

          </div>
        </div>

        <hr class="mt-6 border-b-1 border-blueGray-300" />

        <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
          Select Vehicle
        </h6>
        <div class="flex flex-wrap">
          <div class="w-full lg:w-12/12 px-4">

          </div>
          <div class="w-full lg:w-12/12 px-4">
            <div class="relative w-full mb-3">
              <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                Vehicle
              </label>

              <select id="vehicle-type" name="vehicle"
                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                <option value="" selected>Select Vehicle</option>
                <option :value="vehicle.id" v-for="vehicle in vehicles">
                  <span>{{ vehicle.name }} | </span>
                  <span>{{ vehicle.type }} | </span>
                  <span>{{ vehicle.license_plate }} | </span>
                  <span> Milik {{ vehicle.owner }}</span>
                </option>

              </select>
              <span class="text-red-600" v-if="errors?.vehicle">{{ errors.vehicle }}</span>
            </div>
          </div>

        </div>

        <hr class="mt-6 border-b-1 border-blueGray-300" />

        <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
          Select Driver
        </h6>
        <div class="flex flex-wrap">
          <div class="w-full lg:w-12/12 px-4">
            <div class="relative w-full mb-3">
              <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                Select Driver
              </label>
              <select id="driver" name="driver"
                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                <option value="" selected>Select Driver</option>
                <option :value="driver.id" v-for="driver in drivers">{{ driver.name }}</option>

              </select>
              <span class="text-red-600" v-if="errors?.driver">{{ errors.driver }}</span>
            </div>
          </div>
        </div>
        <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
          Select Approval
        </h6>
        <div class="flex flex-wrap">
          <div class="w-full lg:w-6/12 px-4">
            <div class="relative w-full mb-3">
              <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                Select Approval 1
              </label>
              <select id="approval1" name="approval1_id" v-model="selectedApproval1"
                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                <option value="" selected>Select Approval</option>
                <option :value="approval.id" v-for="approval in availableApprovals">{{ approval.name }}</option>

              </select>
            </div>
          </div>
          <div class="w-full lg:w-6/12 px-4">
            <div class="relative w-full mb-3">
              <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                Select Approval 2
              </label>
              <select id="approval1" name="approval2_id" v-model="selectedApproval2"
                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                <option value="" selected>Select Approval</option>
                <option :value="approval.id" v-for="approval in availableApprovals">{{ approval.name }}</option>

              </select>

            </div>
          </div>
          <span class="text-red-600" v-if="errors?.approval">{{ errors.approval }}</span>
        </div>
        <div class="mt-10 flex justify-end">
          <button
            class="bg-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150 hover:bg-emerald-400"
            type="submit">
            Reserve
          </button>
        </div>
      </form>
    </div>
  </div>
</template>


<script setup>

import { ref, defineProps, computed, onMounted } from 'vue';
import { usePage } from '@inertiajs/vue3'
const props = defineProps({
  vehicles: Array,
  users: Array,
  drivers: Array,
  errors: Object,
  approvals: Array,
})

const page = usePage();
const availableApprovals = ref([])
const selectedApproval1 = ref('')
const selectedApproval2 = ref('')


onMounted(() => {
  availableApprovals.value = props.approvals;
})

const csrf = computed(() => page.props.csrf);




</script>