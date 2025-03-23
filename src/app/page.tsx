import { FileUser, AtSign, Mail } from "lucide-react";
import { Button } from "@/components/ui/button";
import Link from "next/link";
export default function Home() {
  return (
    <main className="flex items-center h-[100vh]">
      <div className="flex flex-row justify-evenly w-screen">
        <div>
          <div className="flex flex-row"></div>
          <h1 className="text-5xl">
            Hi, I'm <strong>Rafael Muijsert</strong>
          </h1>
          <h3 className="text-xl">
            I'm a <strong>software engineer</strong> who loves to build clean
            and scalable systems.
          </h3>
          <div className="mt-4">
            <Button className="mr-4" asChild>
              <Link href="mailto:rafael@muijsert.org">
                <AtSign /> Contact me
              </Link>
            </Button>
            <Button variant={"outline"} asChild>
              <Link href="/">
                <FileUser /> Resume
              </Link>
            </Button>
          </div>
        </div>
      </div>
    </main>
  );
}
