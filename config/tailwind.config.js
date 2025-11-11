module.exports = {
  theme: {
    extend: {
      colors: {
        // Primary brand colors from signin page
        primary: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#f43f5e', // rose-500 - main brand color
          600: '#e11d48',
          700: '#be123c',
          800: '#9f1239',
          900: '#881337',
        },
        // Secondary/accent colors
        accent: {
          50: '#fff7ed',  // orange-50 - card backgrounds
          100: '#ffedd5',
          200: '#fed7aa',
          300: '#fdba74',
          400: '#fb923c',
          500: '#f97316',
          600: '#ea580c',
          700: '#c2410c',
          800: '#9a3412',
          900: '#7c2d12',
        },
        // Neutral colors
        neutral: {
          50: '#fafaf9',   // stone-50
          100: '#f5f5f4',  // stone-100
          200: '#e7e5e4',  // stone-200 - borders
          300: '#d6d3d1',
          400: '#a8a29e',
          500: '#78716c',
          600: '#57534e',
          700: '#44403c',
          800: '#292524',
          900: '#1c1917',
        },
      },
      fontFamily: {
        'heading': ['Expensify New Kansas', 'system-ui', 'sans-serif'],
        'body': ['TT Commons Pro Variable', 'system-ui', 'sans-serif'],
        'demibold': ['TT Commons Pro DemiBold', 'system-ui', 'sans-serif'],
      },
      borderRadius: {
        'card': '1.5rem',  // 24px - rounded-3xl
        'button': '9999px', // rounded-full
      },
      borderWidth: {
        'input': '1.5px',
      },
    },
  },
  plugins: [],
}
