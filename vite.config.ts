import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

// https://vite.dev/config/
export default defineConfig(({ mode }) => ({
  // 生产环境用 '/'，本地开发用 './'
  base: mode === 'production' ? '/' : './',
  
  plugins: [react()],
  
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },

  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    chunkSizeWarningLimit: 1100,
    
    rollupOptions: {
      output: {
        manualChunks(id) {
          // jsPDF 独立拆分（~387KB，无 React 依赖）
          if (id.includes('node_modules/jspdf')) {
            return 'jspdf';
          }
          // html2canvas 独立拆分（~201KB，无 React 依赖）
          if (id.includes('node_modules/html2canvas')) {
            return 'html2canvas';
          }
          // DOMPurify 独立拆分
          if (id.includes('node_modules/dompurify')) {
            return 'purify';
          }
          // Lucide 图标独立拆分（无 React 状态依赖）
          if (id.includes('node_modules/lucide-react')) {
            return 'icons';
          }
          // 通用工具类
          if (
            id.includes('node_modules/clsx') ||
            id.includes('node_modules/tailwind-merge') ||
            id.includes('node_modules/class-variance-authority')
          ) {
            return 'utils';
          }
          // 政策数据库（业务数据，独立缓存）
          if (id.includes('src/engine/policyDatabase') || id.includes('src/engine/taxPolicies')) {
            return 'policy-data';
          }
          // 全球个税合规组件（最大的业务组件，独立拆分）
          if (id.includes('src/components/GlobalPersonalTaxCompliance')) {
            return 'global-tax';
          }
          // React + Recharts + Radix + 其他 node_modules 统一放 vendor
          // （避免相互依赖造成循环 chunk）
          if (id.includes('node_modules/')) {
            return 'vendor';
          }
        }
      }
    },
    
    // 压缩配置（使用 Vite 内置 esbuild）
    minify: 'esbuild',
  },

  // 开发服务器配置
  server: {
    port: 5173,
    open: false,
  },
}));
