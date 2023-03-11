const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*',
    './engines/**/*',
    // ENGINES_CONFIG
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors:{
        sy: {
          '50':'#1AEAE4',
          '100': '#00cdcc',
          aquaborder: '#1BEAE4',
          graybg: '#f3f3f3',
          gray_50:'#F7F7F7',
          lightBlueSYMX:'#C2FFFF',
          lightBlueSY:'#ACFCF4', //Azul claro
          lightBlue:'#1BEAE4', //Azul sy
          blue: '#4e7d96', // azul
          blueLight: '#DBEDFF', //Azul claro Dashboard
          blueDark: '#3B85CB', //Azul oscuro dashboard
          dark:'#424c5a', // azul oscuro
          pink:'#fea4a6', // rosado
          pink_clear: '#FFE4E5', //rosado claro
          aqua:'#7cfcf4', // turquesa
          light: '#1BEAE4', // turquesa 2
          light_one:'#6EF6F3', //turquesa 3
          light_two:'#B0FFFD', //turquesa 4
          light_three: '#D1FFFE',//turquesa 5
          celeste: '#ACFCF4', // celeste
          red:'#ff4d4d', // rojo sy
          redLight:'#ffa29e', // rojo claro
          redClear: '#FFA3A0', //Rojo mas claro
          redLight2:'#ffcdcd', // rojo claro
          blueblack:'#1e2323', // azul negro
          green:'#13B954', // verde
          lightGreen: '#8EFFC3', //Verde fosforecente
          lightGray: '#9CB2B5', //gris claro
          lightGray2: '#f0f0f0', //gris claro 2
          lightGray_50: '#F6F6F8', //gris más cl
          lightGray_30: '#cccccc', //gris cl text input
          gray:'#F3F3F3', //gris
          purple:'#6161D4', //morado
          lightpurple:'#D9D9FF',
          clearPurple: 'rgba(97, 97, 212, 0.7)',
          grayEmployer: '#C4C4C4',
          greenLight: "#c6ffd9", //verde claro
          greenLight2: "#7bff9d", //verde claro
          purpleLight:'#F0F0FF', //morado claro
          yellowBurned:'#FFD94F' //Amarillo quemado claro
        }
      },
      borderWidth: {
        '3':'3px',
      },
      borderRadius: {
        'sy':'18px',
        '4xl': '2rem',
      },
      boxShadow: {
        'nav': '0 0 12px 0 rgba(218, 218, 220, 0.7)'
      },
      fontFamily: {
        sans: ['Roboto', 'Nunito', ...defaultTheme.fontFamily.sans],
      },
      width:{
        'register-body':"91%"
      },
      padding: {
        '86':'22rem'
      }
    },
    variants: {
      extend: {},
    },
    plugins: [
      require('@tailwindcss/forms'),
      require('@tailwindcss/aspect-ratio'),
      require('@tailwindcss/typography'),
    ]
  }
}