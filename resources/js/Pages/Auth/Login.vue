<template>
  <Head title="Login" />
  <Auth>
    <div class="container mx-auto px-4 h-screen my-auto">
      <div class="flex content-center items-center justify-center h-full ">
        <div class="w-full lg:w-4/12 px-4">
          <div
            class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-blueGray-200 border-0">

            <div class="flex-auto px-4 lg:px-10 py-10 pt-0 mt-5">
              <div class="text-blueGray-600 text-center mb-3 font-bold text-xl">
                <h1>Sign In</h1>
              </div>
              <form method="post" :action="route('login')">
                <input type="hidden" name="_token" :value="csrf">
                <div class="relative w-full mb-3">
                  <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                    Email
                  </label>
                  <input type="email" name="email"
                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                    placeholder="Email" />
                  <span class="text-red-600" v-if="errors?.email">{{ errors.email }}</span>
                </div>

                <div class="relative w-full mb-3">
                  <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                    Password
                  </label>
                  <input type="password" name="password"
                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                    placeholder="Password" />
                  <span class="text-red-600" v-if="errors?.password">{{ errors.password }}</span>
                </div>
                <div>
                  <label class="inline-flex items-center cursor-pointer">
                    <input id="customCheckLogin" type="checkbox" name="remember"
                      class="form-checkbox border-0 rounded text-blueGray-700 ml-1 w-5 h-5 ease-linear transition-all duration-150" />
                    <span class="ml-2 text-sm font-semibold text-blueGray-600">
                      Remember me
                    </span>
                  </label>
                </div>

                <div class="text-center mt-6">
                  <button
                    class="bg-emerald-600 hover:bg-emerald-500 text-white active:bg-blueGray-600 text-sm font-bold uppercase px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
                    type="submit">
                    Sign In
                  </button>
                </div>
              </form>
            </div>
          </div>
          <div class="flex flex-wrap mt-6 relative">
            <div class="w-1/2">
              <a href="javascript:void(0)" class="text-blueGray-200">
                <small>Forgot password?</small>
              </a>
            </div>
            <div class="w-1/2 text-right">
              <a href="register" class="text-blueGray-200"><small>Create new account</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Auth>
</template>
<script setup>
import { Head } from "@inertiajs/vue3";
import Auth from '@/Layouts/Auth.vue';
import { usePage } from "@inertiajs/vue3";
import { defineProps } from "vue";

const page = usePage()

const csrf = page.props.csrf;

defineProps({
  errors: Object,
})
</script>
