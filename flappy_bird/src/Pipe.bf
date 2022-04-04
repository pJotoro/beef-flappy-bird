using SDL2;

namespace flappy_bird
{
	class Pipe {
		public double x;
		public double y;
		public static Image sprite;

		public void Update() {
			x -= 5;
			if (x + sprite.mWidth + 50 <= 0) {
				delete this;
				pipes.PopFront();
			}
		}

		public void Draw() {
			app.Draw(sprite, x, y, 1.5, 1.5);
		}
	}
}