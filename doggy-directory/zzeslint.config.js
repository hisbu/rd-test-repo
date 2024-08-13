// import { ESLint } from "eslint";
import react from 'eslint-plugin-react';
import prettier from 'eslint-plugin-prettier';
import eslintRecommended from 'eslint/conf/eslint-recommended';
import reactRecommended from 'eslint-plugin-react/configs/recommended';
import prettierRecommended from 'eslint-plugin-prettier/configs/recommended';

export default [
  {
    files: ['**/*.{js,jsx,mjs}'],
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      parserOptions: {
        ecmaFeatures: {
          jsx: true
        }
      }
    },
    env: {
      browser: true,
      es2021: true,
      jest: true
    },
    plugins: {
      react,
      prettier
    },
    rules: {
      'react/react-in-jsx-scope': 'off',
      'prettier/prettier': 'error'
    },
    settings: {
      react: {
        version: 'detect'
      }
    },
    linterOptions: {
      // Apply the default configs that were extended in the JSON file.
      extend: [eslintRecommended, reactRecommended, prettierRecommended]
    }
  }
];
