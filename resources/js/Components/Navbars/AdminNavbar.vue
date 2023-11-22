<template>
  <!-- Navbar -->
  <nav
    class="absolute top-0 left-0 w-full z-10 bg-transparent md:flex-row md:flex-nowrap md:justify-start flex items-center p-4">
    <div class="w-full mx-autp items-center flex justify-between md:flex-nowrap flex-wrap md:px-10 px-4">
      <!-- Brand -->
      <a class="text-white text-sm uppercase hidden lg:inline-block font-semibold" href="javascript:void(0)">
        {{ route().current().split('.')[0] }}
      </a>
      <!-- Form -->
      <form class="md:flex hidden flex-row flex-wrap items-center lg:ml-auto mr-3">
        <div class="relative flex w-full flex-wrap items-stretch">
          <span class="uppercase font-bold text-white">
            {{ user.name }}
          </span>
        </div>
      </form>

      <!-- User -->
      <ul class="flex-col md:flex-row list-none items-center hidden md:flex">
        <user-dropdown />
      </ul>
    </div>
  </nav>
  <!-- End Navbar -->
</template>

<script setup>
import UserDropdown from "@/Components/Dropdowns/UserDropdown.vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage()
const user = page.props.auth.user

</script>
