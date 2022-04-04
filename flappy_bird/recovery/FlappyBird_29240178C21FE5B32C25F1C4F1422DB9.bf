using System;
using static System.Diagnostics.Debug;
using SDL2;

namespace flappy_bird
{
	static class FlappyBird {
		public static Image sprite;
		private static double x = 300;
		private static double y = 0;
		private static double verticalSpeed = 0;
		private static double jumpSpeed = 8;
		private static double hitboxX = 50;
		private static double hitboxY = 50;

		public static void Init() {
			let error = sprite.Load("../../../assets/Flappy_Bird.png");
			if (error == .Err) {
				Console.WriteLine("Failed to load flappy bird");
			}
		}

		public static void Update() {
			verticalSpeed += gravity;
			if (upButtonClicked) {
				verticalSpeed = -jumpSpeed;
			}
			y += verticalSpeed;
			if (y > 768) {
				Assert(1 == 0);
			}
			for (let pipe in pipes) {
				if (x + hitboxX >= pipe.x && x <= pipe.x + Pipe.sprite.mWidth && y + hitboxY >= pipe.y && y <= pipe.y + Pipe.sprite.mHeight) {
					Assert(1 == 0);
				}
			}
		}

		public static void Draw() {
			app.Draw(sprite, x, y, 0.5, 0.5);
		}
	}
}