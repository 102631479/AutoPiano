<style lang="less" scoped>
@import url('../assets/style/variable.less');
.modal-overlay {
  z-index: 1000;
}
.loader span {
  display: block;
  bottom: 0;
  width: 9px;
  height: 5px;
  background: @c-blue;
  position: absolute;
  animation: soundBar 3s infinite ease-in-out;
}
.loader span:nth-child(1) { left: 0; }
.loader span:nth-child(2) { left: 10px; animation-delay: 0.2s; }
.loader span:nth-child(3) { left: 20px; animation-delay: 0.4s; }
.loader span:nth-child(4) { left: 30px; animation-delay: 0.6s; }
.loader span:nth-child(5) { left: 40px; animation-delay: 0.8s; }
.loader span:nth-child(6) { left: 50px; animation-delay: 1s; }
.loader span:nth-child(7) { left: 60px; animation-delay: 1.2s; }
.loader span:nth-child(8) { left: 70px; animation-delay: 1.4s; }
@keyframes soundBar {
  0% { height: 5px; background: @c-blue; }
  20% { height: 50px; background: @c-red; }
  40% { height: 5px; background: @c-blue; }
  60%, 100% { height: 5px; background: @c-blue; }
}
</style>

<template>
  <div
    v-show="loaderShow"
    class="modal-overlay fixed inset-0 flex items-center justify-center"
  >
    <div
      class="w-32 rounded-lg bg-black bg-opacity-60 px-5 py-4 shadow-xl"
    >
      <div class="loader relative mx-auto h-20 w-20 bg-transparent">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <p class="mt-2.5 text-center text-sm text-white">{{ tipTxt }}</p>
    </div>
  </div>
</template>

<script>
import Observe from 'observe'
import { OBEvent } from 'config'
export default {
  name: 'ModalLoader',
  components: {},
  mixins: [],
  props: [],
  data() {
    return {
      tipTxt: '请稍候',
      loaderShow: false
    }
  },
  computed: {},
  mounted() {
    Observe.$on(OBEvent.SHOW_GLOBAL_LOADING, (data) => {
      this.loaderShow = true
      this.tipTxt = data ? data.txt : '请稍候'
    })
    Observe.$on(OBEvent.HIDE_GLOBAL_LOADING, () => {
      this.loaderShow = false
    })
  },
  watch: {},
  methods: {}
}
</script>
