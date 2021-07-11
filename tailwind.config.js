module.exports = {
  mode: "jit",
  purge: {
    content: ["./src/**/*.{js,jsx,ts,tsx}", "./index.html"],
    safelist: [],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
