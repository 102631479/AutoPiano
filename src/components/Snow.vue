<template>
  <canvas
    ref="canvas"
    class="snow-canvas"
  ></canvas>
</template>

<script>
export default {
  name: 'Snow',
  data() {
    return {
      flakes: [],
      animationId: null,
    }
  },
  mounted() {
    this.initSnow()
    this.animate()
    window.addEventListener('resize', this.initSnow)
  },
  beforeDestroy() {
    if (this.animationId) {
      cancelAnimationFrame(this.animationId)
    }
    window.removeEventListener('resize', this.initSnow)
  },
  methods: {
    initSnow() {
      const canvas = this.$refs.canvas
      if (!canvas) return
      const ctx = canvas.getContext('2d')
      const dpr = window.devicePixelRatio || 1
      canvas.width = window.innerWidth * dpr
      canvas.height = window.innerHeight * dpr
      canvas.style.width = window.innerWidth + 'px'
      canvas.style.height = window.innerHeight + 'px'
      ctx.scale(dpr, dpr)
      this.ctx = ctx
      this.w = window.innerWidth
      this.h = window.innerHeight
      const count = Math.min(80, Math.floor((this.w * this.h) / 15000))
      this.flakes = []
      for (let i = 0; i < count; i++) {
        this.flakes.push({
          x: Math.random() * this.w,
          y: Math.random() * this.h,
          r: 1.5 + Math.random() * 2,
          speedY: 0.5 + Math.random() * 1.5,
          speedX: (Math.random() - 0.5) * 0.8,
          opacity: 0.4 + Math.random() * 0.5,
        })
      }
    },
    animate() {
      const canvas = this.$refs.canvas
      if (!canvas || !this.ctx || !this.flakes.length) {
        this.animationId = requestAnimationFrame(() => this.animate())
        return
      }
      const ctx = this.ctx
      const w = this.w
      const h = this.h
      ctx.clearRect(0, 0, w, h)
      this.flakes.forEach((f) => {
        ctx.beginPath()
        ctx.arc(f.x, f.y, f.r, 0, Math.PI * 2)
        ctx.fillStyle = `rgba(255, 255, 255, ${f.opacity})`
        ctx.fill()
        f.y += f.speedY
        f.x += f.speedX
        if (f.y > h + 5) {
          f.y = -5
          f.x = Math.random() * w
        }
        if (f.x > w + 5) f.x = -5
        if (f.x < -5) f.x = w + 5
      })
      this.animationId = requestAnimationFrame(() => this.animate())
    },
  },
}
</script>

<style lang="less" scoped>
.snow-canvas {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  pointer-events: none;
}
</style>
