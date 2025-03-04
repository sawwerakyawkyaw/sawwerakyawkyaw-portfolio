// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/app_web.ex",
    "../lib/app_web/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        colors: {
          // Use custom names that make sense in your design system
          'bg-light-grey': '#F3F3F3',
          'bg-off-white': '#f9f9f9',
          'border-color': '#D4D4D4',
          'text-color': '#202124',
          'secondary-text': '#999CA2',

          // Primary color set
          'primary': '#12c98c',
          'primary-hover': 'rgba(18, 201, 140, 0.35)',

          // Office color set
          'office': '#12c98c',
          'office-hover': 'rgba(18, 201, 140, 0.35)',
          'office-hover-light': 'rgba(18, 201, 140, 0.15)',

          // Studio color set
          'studio': '#5572f3',
          'studio-hover': 'rgba(89, 122, 255, 0.35)',
          'studio-hover-light': 'rgba(89, 122, 255, 0.15)',

          // Garage color set
          'garage': '#f57921',
          'garage-hover': 'rgba(255, 138, 49, 0.35)',
          'garage-hover-light': 'rgba(255, 138, 49, 0.15)',

          // Shop color set
          'shop': '#be64fe',
          'shop-hover': 'rgba(190, 100, 254, 0.35)',
          'shop-hover-light': 'rgba(190, 100, 254, 0.15)',
        },
      },
      keyframes: {
        // keyframes name must match the name you use in your animation property
        'gradient-animation': {
          '0%': {
            'background-position': '0% 50%',
          },
          '50%': {
            'background-position': '100% 50%',
          },
          '100%': {
            'background-position': '0% 50%',
          }
        },
      },
      animation: {
        // This name is what you will use with `animate-<NAME>` utilities
        'gradient-animation': 'gradient-animation 10s ease infinite',
      },
      fontFamily: {
        sans: ['Quicksand', 'sans-serif'],
        serif: ['Manrope', 'serif'],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}
