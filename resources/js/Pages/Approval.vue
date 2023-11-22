<template>
    <Head title="Reservation" />
    <Main>
        <div class="flex flex-wrap">
            <div class="w-full lg:w-full px-4">
                <CardApprovalList :approvals="approvals" :user="user" />
            </div>
        </div>
    </Main>
</template>

<script setup>
import CardApprovalList from "@/Components/Cards/CardApprovalList.vue";
import Main from "@/Layouts/Main.vue";
import { Head } from "@inertiajs/vue3";
import { defineProps } from "vue";


defineProps({
    approvals: Array,
    user: Object,
})

</script>
