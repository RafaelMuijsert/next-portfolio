export default function Home() {
  return (
    <main className="flex items-center h-[100vh]">
      <div className="flex flex-row justify-evenly w-screen">
        <div>
          <h1 className="font-bold text-5xl">
            Hi, I'm{" "}
            <span className="text-transparent bg-clip-text bg-gradient-to-br from-[#EF4444] to-[#5F244f] ">
              Rafael Muijsert
            </span>
          </h1>
          <h2 className="text-xl">Bruh</h2>
        </div>
        <div>Photo</div>
      </div>
    </main>
  );
}
