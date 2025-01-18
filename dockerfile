# ベースイメージとして Node.js を使用
FROM node:18-alpine

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# package.json と package-lock.json をコピー
COPY package*.json ./

RUN ls -l /usr/src/app

# 依存関係をインストール
RUN npm install

# 必要な追加依存関係（PostCSS や Autoprefixer）をインストール
RUN npm install postcss autoprefixer

# ソースコードをコピー
COPY . .

# アプリをビルド
RUN npm run build

# アプリを起動
CMD ["npm", "run", "start"]
