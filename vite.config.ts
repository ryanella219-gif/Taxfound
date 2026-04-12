import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

// https://vite.dev/config/
export default defineConfig(({ mode }) => ({
  base: mode === 'production' ? '/' : './',
  plugins: [
    react(),
    // 仅开发环境加载 inspect 插件
    mode === 'development' && (() => {
      try {
        return require('kimi-plugin-inspect-react').inspectAttr();
      } catch {
        return null;
      }
    })(),
  ].filter(Boolean),
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
  },
}));
