<template>
    <Head title="Vehicles" />
    <Main>
        <div class="flex flex-wrap">
            <div class="w-full lg:w-full px-4">
                <CardVehicleList :vehicles="vehicles" />
            </div>
        </div>
    </Main>
</template>
<script setup>
import CardVehicleList from "@/Components/Cards/CardVehicleList.vue";
import Main from "@/Layouts/Main.vue";
import { Head } from "@inertiajs/vue3";
import { defineProps } from "vue";


defineProps({
    vehicles: Array,
})

</script>
