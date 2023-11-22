<template>
    <div class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded  z-0 "
        :class="[color === 'light' ? 'bg-white' : 'bg-emerald-900 text-white']">
        <div class="rounded-t mb-0 px-4 py-3 border-0">
            <div class="flex flex-wrap items-center">
                <div class="relative w-full px-4 max-w-full flex-grow flex-1">
                    <h3 class="font-semibold text-lg" :class="[color === 'light' ? 'text-blueGray-700' : 'text-white']">
                        Reservation List
                    </h3>
                </div>
            </div>
        </div>
        <div class="block w-full overflow-x-auto relative z-0 overflow-y-visible">
            <!-- Projects table -->
            <table class="items-center w-full bg-transparent border-collapse ">
                <thead>
                    <tr>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            User
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Driver
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Vehicle
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Status
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Reservation Date
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Approve?
                        </th>
                        <th class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                            :class="[
                                color === 'light'
                                    ? 'bg-blueGray-50 text-blueGray-500 border-blueGray-100'
                                    : 'bg-emerald-800 text-emerald-300 border-emerald-700',
                            ]">
                            Status by You
                        </th>



                    </tr>
                </thead>
                <tbody>
                    <tr v-for="approval in approvals">
                        <th
                            class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left">
                            {{ approval.user.name }}
                        </th>
                        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                            {{ approval.driver.name }}
                        </td>
                        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                            {{ approval.vehicle.name }}
                        </td>
                        <td
                            class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 uppercase">
                            {{ approval.status }}
                        </td>
                        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                            {{ approval.reservation_date }}
                        </td>

                        <td
                            class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex">
                            <form :action="route('approval.approve')" method="post">
                                <input type="hidden" name="_token" :value="csrf">
                                <input type="hidden" name="approve" value="true">
                                <input type="hidden" name="id" :value="approval.id">
                                <button
                                    class="border border-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150 hover:bg-emerald-400"
                                    type="submit">
                                    ✔
                                </button>
                            </form>
                            <form :action="route('approval.approve')" method="post">
                                <input type="hidden" name="_token" :value="csrf">
                                <input type="hidden" name="approve" value="false">
                                <input type="hidden" name="id" :value="approval.id">
                                <button
                                    class="border border-red-500 text-white active:bg-red-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150 hover:bg-red-400"
                                    type="submit">
                                    ❌
                                </button>
                            </form>
                        </td>
                        <td
                            class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left uppercase">

                            <div v-if="user.id == approval.approval1_id">
                                {{ (approval.aprroval1) }}
                            </div>
                            <div v-else>
                                {{ (approval.aprroval2) }}
                            </div>
                        </td>

                    </tr>

                </tbody>
            </table>
        </div>
    </div>
</template>
<script setup>

import { defineProps, ref } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();
const csrf = page.props.csrf;
const color = ref('light')
const isExpanded = ref(false);
const selectedOption = ref(false);
const options = ref([true, false]);

defineProps({
    approvals: Array,
    user: Object,
})

const setOption = (option) => {
    selectedOption.value = option;
    isExpanded.value = false;
}

</script>
