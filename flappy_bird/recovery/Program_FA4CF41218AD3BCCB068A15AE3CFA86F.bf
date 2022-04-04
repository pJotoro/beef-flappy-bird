using SDL2;
using System;
using System.Collections;

namespace flappy_bird
{
	static {
		public static App app;
		public static bool upButtonClicked = false;
		public static readonly double gravity = 0.3;
		public static List<Pipe> pipes;
		public static uint pipeSpawnDelay = 100;
	}

	class App : SDLApp {
		public override void Update()
		{
			pipeSpawnDelay--;
			if (pipeSpawnDelay == 0) {
				pipeSpawnDelay = 100;
				Pipe pipe = new .();
				pipe.x = 800;
				pipe.y = 500;
				pipes.Add(pipe);
			}
			if (IsKeyDown(.Up) && !upButtonClicked) {
				upButtonClicked = true;
			}
			else if (!IsKeyDown(.Up)) {
				upButtonClicked = false;
			}
			FlappyBird.Update();
			for (let pipe in pipes) {
				pipe.Update();
			}
			Render(); // NOTE(pJotoro): Calls Draw().
		}

		public override void Draw() {
			FlappyBird.Draw();
			for (let pipe in pipes) {
				pipe.Draw();
			}
		}
	}

	class Program
	{
		public static void Main() {
			app = scope .();
			app.Init();
			FlappyBird.sprite = scope .();
			FlappyBird.Init();
			Pipe.sprite = scope .();
			let error = Pipe.sprite.Load("../../../assets/mario_pipe.png");
			if (error == .Err) {
				Console.WriteLine("Failed to load pipe");
			}
			pipes = scope .();
			app.Run();
		}
	}
}