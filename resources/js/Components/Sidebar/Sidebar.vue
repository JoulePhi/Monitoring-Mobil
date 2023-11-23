<template>
    <nav
        class="md:left-0 md:block md:fixed md:top-0 md:bottom-0 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-xl bg-white flex flex-wrap items-center justify-between relative md:w-64 z-10 py-4 px-6">
        <div
            class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between w-full mx-auto">
            <!-- Toggler -->
            <button
                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                type="button" v-on:click="toggleCollapseShow('bg-white m-2 py-3 px-6')">
                <i class="fas fa-bars"></i>
            </button>
            <!-- Brand -->
            <p class="md:block text-left md:pb-2 text-blueGray-600 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-4 px-0"
                to="/">
                Monitoring Kendaraan
            </p>
            <!-- User -->
            <ul class="md:hidden items-center flex flex-wrap list-none">
                <li class="inline-block relative">
                    <notification-dropdown />
                </li>
                <li class="inline-block relative">
                    <user-dropdown />
                </li>
            </ul>
            <!-- Collapse -->
            <div class="md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded"
                v-bind:class="collapseShow">
                <!-- Collapse header -->
                <div class="md:min-w-full md:hidden block pb-4 mb-4 border-b border-solid border-blueGray-200">
                    <div class="flex flex-wrap">
                        <div class="w-6/12">
                            <p class="md:block text-left md:pb-2 text-blueGray-600 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-4 px-0"
                                to="/">
                                Monitoring Kendaraan
                            </p>
                        </div>
                        <div class="w-6/12 flex justify-end">
                            <button type="button"
                                class="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                                v-on:click="toggleCollapseShow('hidden')">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Form -->
                <form class="mt-6 mb-4 md:hidden">
                    <div class="mb-3 pt-0">
                        <input type="text" placeholder="Search"
                            class=" px-3 py-2 h-12 border border-solid border-blueGray-500 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-base leading-snug shadow-none outline-none focus:outline-none w-full font-normal" />
                    </div>
                </form>

                <!-- Divider -->
                <hr class="my-4 md:min-w-full" />
                <!-- Heading -->
                <h6 class="md:min-w-full text-blueGray-500 text-xs uppercase font-bold block pt-1 pb-4 no-underline">
                    Menu
                </h6>
                <!-- Navigation -->
                <div v-if="user.role == 'ADMIN'">
                    <ul class="md:flex-col md:min-w-full flex flex-col list-none">
                        <li class="items-center">
                            <a href="dashboard" @click="navigate" class="text-xs uppercase py-3 font-bold block" :class="[
                                route().current('dashboard.index')
                                    ? 'text-emerald-500 hover:text-emerald-600'
                                    : 'text-blueGray-700 hover:text-blueGray-500',
                            ]">

                                Dashboard
                            </a>
                        </li>

                        <li class="items-center">
                            <a href="reservation" @click="navigate" class="text-xs uppercase py-3 font-bold block" :class="[
                                route().current('reservation.index')
                                    ? 'text-emerald-500 hover:text-emerald-600'
                                    : 'text-blueGray-700 hover:text-blueGray-500',
                            ]">

                                Reservation
                            </a>
                        </li>
                    </ul>
                </div>
                <div v-if="user.role == 'APPROVAL'">
                    <ul class="md:flex-col md:min-w-full flex flex-col list-none">
                        <li class="items-center">
                            <a href="dashboard" @click="navigate" class="text-xs uppercase py-3 font-bold block" :class="[
                                route().current('dashboard.index')
                                    ? 'text-emerald-500 hover:text-emerald-600'
                                    : 'text-blueGray-700 hover:text-blueGray-500',
                            ]">

                                Dashboard
                            </a>
                        </li>

                        <li class="items-center">
                            <a href="approval" @click="navigate" class="text-xs uppercase py-3 font-bold block" :class="[
                                route().current('approval.index')
                                    ? 'text-emerald-500 hover:text-emerald-600'
                                    : 'text-blueGray-700 hover:text-blueGray-500',
                            ]">

                                Approval
                            </a>
                        </li>
                    </ul>
                </div>
                <a href="vehicles" @click="navigate" class="text-xs uppercase py-3 font-bold block" :class="[
                    route().current('vehicles.index')
                        ? 'text-emerald-500 hover:text-emerald-600'
                        : 'text-blueGray-700 hover:text-blueGray-500',
                ]">

                    Vehicles
                </a>
                <!-- Divider -->
                <hr class="my-4 md:min-w-full" />
                <div class="mt-10 flex justify-start">
                    <form :action="route('logout')" method="post">
                        <input type="hidden" name="_token" :value="csrf">
                        <button
                            class="bg-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150 hover:bg-emerald-400"
                            type="submit">
                            Logout
                        </button>
                    </form>
                </div>
            </div>

        </div>
    </nav>
</template>

<script>
import NotificationDropdown from "@/Components/Dropdowns/NotificationDropdown.vue";
import UserDropdown from "@/Components/Dropdowns/UserDropdown.vue";
import { usePage } from "@inertiajs/vue3";

export default {
    data() {
        return {
            collapseShow: "hidden",
            page: usePage(),
            csrf: this.$page.props.csrf,
            user: this.$page.props.auth.user,
        };
    },
    methods: {
        toggleCollapseShow: function (classes) {
            this.collapseShow = classes;
        },
    },
    components: {
        NotificationDropdown,
        UserDropdown,
    },
};
</script>
