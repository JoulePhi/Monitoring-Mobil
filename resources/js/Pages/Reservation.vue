<template>
    <Head title="Reservation" />
    <Main>
        <div class="flex flex-wrap">
            <div class="w-full lg:w-full px-4">
                <CardReservation :vehicles="vehicles" :users="users" :drivers="drivers" :errors="errors"
                    :approvals="approvals" />
                <CardReservationList :reservations="reservations" />
            </div>
        </div>
    </Main>
</template>
<script setup>
import CardReservation from "@/Components/Cards/CardReservation.vue";
import CardReservationList from "@/Components/Cards/CardReservationList.vue";
import Main from "@/Layouts/Main.vue";
import { Head } from "@inertiajs/vue3";
import { defineProps } from "vue";


defineProps({
    vehicles: Array,
    users: Array,
    drivers: Array,
    errors: Object,
    reservations: Array,
    approvals: Array,
})

</script>
