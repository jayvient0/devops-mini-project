# Stage 1: Build & Install Dependencies
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Stage 2: Minimal Runtime Image
FROM node:20-alpine
WORKDIR /app

# Create a non-root user for security best practices
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy dependencies and application files from the builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Switch to the non-root user
USER appuser

EXPOSE 3000

CMD ["npm", "start"]
