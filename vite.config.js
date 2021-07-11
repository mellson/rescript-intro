import reactRefresh from "@vitejs/plugin-react-refresh"
import { defineConfig } from "vite"

const config = defineConfig({
  plugins: [reactRefresh()],
})

export default config
