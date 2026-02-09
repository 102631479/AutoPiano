<style lang="less">
@import url("../assets/style/variable.less");
.component-page-footer {
  width: 100%;
  min-width: 1280px;
  height: 40px;
  line-height: 40px;
  background: rgba(255, 255, 255, 0.8);
  border-top: solid 1px #ccc;
  position: fixed;
  bottom: 0;
  text-align: center;
  .footer-ul {
    width: auto;
    height: 100%;
    .footer-item {
      display: inline;
      list-style: none;
      position: relative;
      a {
        &:hover {
          color: #fff;
          background: @c-blue;
        }
      }
    }
  }
  .footer-ul.left-section {
    float: left;
    margin-left: 5%;
  }
}
</style>

<template>
  <div class="component-page-footer clearfix" v-if="false">

  </div>
</template>

<script>
export default {
  name: "PageFooter",
  data() {
    return {};
  },
  mounted() {},
  methods: {}
};
</script>
