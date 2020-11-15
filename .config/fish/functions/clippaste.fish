function clippaste --description 'Paste clipboard to stdout'
  if is_wsl
    # paste.cs from https://gist.github.com/jpflouret/19da43372e643352a1bf
    # If that ever goes down, compile this with %SystemRoot%\Microsoft.NET\Framework\v3.5\csc /o paste.cs
    # using System;
    # using System.Windows.Forms;

    # namespace jpf {
    #     class paste {
    #         [STAThread]
    #         public static int Main(string[] args) {
    #             Console.Write(Clipboard.GetText());
    #             return 0;
    #         }
    #     }
    # }

    paste.exe
  else
    # TODO does this also work in Wayland?
    xsel --clipboard --output
  end
end
