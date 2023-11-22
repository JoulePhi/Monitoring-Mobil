<template>
  <div>
    <main>
      <section class="relative w-full h-full py-40 min-h-screen">
        <div class="absolute top-0 w-full h-full  bg-no-repeat bg-full bg-emerald-600"></div>
        <slot />
      </section>
    </main>
  </div>
</template>


<script setup>
import FooterSmall from "@/Components/Footers/FooterSmall.vue";
import registerBg2 from "@/Assets/img/register_bg_2.png";



</script>
