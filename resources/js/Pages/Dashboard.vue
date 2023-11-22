<script setup>
import Main from "@/Layouts/Main.vue";
import { Head } from "@inertiajs/vue3";
import CardLineChart from "@/Components/Cards/CardLineChart.vue";
</script>

<template>
    <Head title="Dashboard" />
    <Main>
        <div>
            <div class="flex flex-wrap">
                <div class="w-full xl:w-12/12 mb-12 xl:mb-0 px-4">
                    <card-line-chart />
                </div>
            </div>
        </div>
    </Main>
</template>
