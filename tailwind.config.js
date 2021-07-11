module.exports = {
  mode: "jit",
  purge: {
    content: ["./src/**/*.{js,jsx,ts,tsx}", "./index.html"],
    safelist: [],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      animation: {
        gradient: "gradient 10s ease infinite",
      },
      keyframes: {
        gradient: {
          "0%, 100%": {
            "background-size": "200% 200%",
            "background-position": "left center",
          },
          "50%": {
            "background-size": "200% 200%",
            "background-position": "right center",
          },
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
