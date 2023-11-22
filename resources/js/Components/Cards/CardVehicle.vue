<template>
    <div class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-blueGray-100 border-0">
        <div class="rounded-t bg-white mb-0 px-6 py-6">
            <div class="text-center flex justify-between">
                <h6 class="text-blueGray-700 text-xl font-bold">Vehicle</h6>

            </div>
        </div>
        <div class="flex-auto px-4 lg:px-10 py-10 pt-0 z-0">
            <form>
                <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
                    Add Vehicle
                </h6>
                <div class="flex flex-wrap">
                    <div class="w-full lg:w-6/12 px-4">
                        <div class="relative w-full mb-3">
                            <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                                Name
                            </label>
                            <input type="text"
                                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                                value="lucky.jesse" />
                        </div>
                    </div>
                    <div class="w-full lg:w-6/12 px-4">
                        <div class="relative w-full mb-3">
                            <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                                Licenses Plate
                            </label>
                            <input type="email"
                                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150"
                                value="jesse@example.com" />
                        </div>
                    </div>
                </div>


                <hr class="mt-6 border-b-1 border-blueGray-300" />

                <h6 class="text-blueGray-400 text-sm mt-3 mb-6 font-bold uppercase">
                    Select Vehicle
                </h6>
                <div class="flex flex-wrap">
                    <div class="w-full lg:w-12/12 px-4">
                        <div class="relative w-full mb-3">
                            <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                                Type
                            </label>

                            <select id="vehicle-type"
                                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                                <option value="" selected>Select Type</option>
                                <option value="angkutan_barang">Angkutan Barang</option>
                                <option value="angkutan_orang">Angkutan Orang</option>

                            </select>

                        </div>
                    </div>
                    <div class="w-full lg:w-12/12 px-4">
                        <div class="relative w-full mb-3">
                            <label class="block uppercase text-blueGray-600 text-xs font-bold mb-2" htmlFor="grid-password">
                                Owner
                            </label>

                            <select id="vehicle-type"
                                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                                <option value="" selected>Select Owner</option>
                                <option value="perusahaan">Perusahaan</option>
                                <option value="penyewaan">Menyewa</option>

                            </select>

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
                            <select id="vehicle-type"
                                class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150 text-left focus:ring-emerald-500">

                                <option value="" selected>Select Driver</option>
                                <option value="perusahaan">Perusahaan</option>
                                <option value="penyewaan">Menyewa</option>

                            </select>
                        </div>
                    </div>
                </div>
                <div class="mt-10 flex justify-end">
                    <button
                        class="bg-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 ease-linear transition-all duration-150 hover:bg-emerald-400"
                        type="button">
                        Reserve
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>


<script setup>



</script>