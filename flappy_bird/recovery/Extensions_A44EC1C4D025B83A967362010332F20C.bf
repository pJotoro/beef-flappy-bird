namespace SDL2 {
	extension SDLApp {
		public void Draw(Image image, double x, double y, double scaleX, double scaleY) {
			SDL.Rect srcRect = .(0, 0, image.mWidth, image.mHeight);
			SDL.Rect destRect = .((int32)x, (int32)y, (int32)((double)image.mWidth * scaleX), (int32)((double)image.mHeight * scaleY));
			SDL.RenderCopy(mRenderer, image.mTexture, &srcRect, &destRect);
		}
	}
}