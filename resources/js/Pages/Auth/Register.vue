<template>
  <Head title="Register" />
  <Auth>
    <div class="container mx-auto px-4 h-full bg-red-400">
      <div class="flex content-center items-center justify-center h-full">
        <div class="w-full lg:w-6/12 px-4">
          <div
            class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-blueGray-200 border-0">

            <div class="flex-auto px-4 lg:px-10 py-10 pt-0 mt-5">
              <div class="text-center mb-3 font-bold text-xl text-blueGray-600">
                <h1>Sign Up</h1>
              </div>
              <form method="post" :action="route('register')">
                <input type="hidden" name="_token" :value="csrf">
                <div class="relative w-full mb-3">
                  <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                    Name
                  </label>
                  <input type="text" name="name"
                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                    placeholder="Name" />

                </div>

                <div class="relative w-full mb-3">
                  <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                    Email
                  </label>
                  <input type="email" name="email"
                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                    placeholder="Email" />
                </div>

                <div class="relative w-full mb-3">
                  <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                    Password
                  </label>
                  <input type="password" name="password"
                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                    placeholder="Password" />
                </div>

                <div>
                  <label class="inline-flex items-center cursor-pointer">
                    <input id="customCheckLogin" type="checkbox"
                      class="form-checkbox border-0 rounded text-blueGray-700 ml-1 w-5 h-5 ease-linear transition-all duration-150" />
                    <span class="ml-2 text-sm font-semibold text-blueGray-600">
                      I agree with the
                      <a href="javascript:void(0)" class="text-emerald-500">
                        Privacy Policy
                      </a>
                    </span>
                  </label>
                </div>

                <div class="text-center mt-6">
                  <button
                    class="bg-blueGray-800 text-white active:bg-blueGray-600 text-sm font-bold uppercase px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
                    type="submit">
                    Create Account
                  </button>
                </div>
              </form>
            </div>
          </div>
          <div class="flex flex-wrap mt-6 relative">
            <div class="w-1/2">
              <a href="javascript:void(0)" class="text-blueGray-200">
                <small></small>
              </a>
            </div>
            <div class="w-1/2 text-right">
              <a href="login" class="text-blueGray-200"><small>Already Have an Account? Login</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Auth>
</template>
<script setup>
import { Head, usePage } from '@inertiajs/vue3';
import Auth from '@/Layouts/Auth.vue';
import { defineProps, onMounted } from 'vue';


const page = usePage()

const csrf = page.props.csrf;
const props = defineProps({
  errors: Object
})

onMounted(() => {
  console.log(props.errors)
})
</script>
