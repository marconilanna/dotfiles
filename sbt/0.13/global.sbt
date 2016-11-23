// ~/.sbt/0.13/global.sbt

// Statements executed when starting the Scala REPL (sbt's `console` task)

initialCommands := """
import
  scala.annotation.{switch, tailrec},
  scala.beans.{BeanProperty, BooleanBeanProperty},
  scala.collection.JavaConverters._,
  scala.collection.{breakOut, mutable},
  scala.concurrent.{Await, ExecutionContext, Future},
  scala.concurrent.ExecutionContext.Implicits.global,
  scala.concurrent.duration._,
  scala.language.experimental.macros,
  scala.math._,
  scala.reflect.macros.blackbox,
  scala.util.{Failure, Random, Success, Try},
  scala.util.control.NonFatal,
  java.io._,
  java.net._,
  java.nio.file._,
  java.time.{Duration => jDuration, _},
  System.{currentTimeMillis => now},
  System.nanoTime

def desugarImpl[T](c: blackbox.Context)(expr: c.Expr[T]): c.Expr[Unit] = {
  import c.universe._, scala.io.AnsiColor.{BOLD, GREEN, RESET}

  val exp = show(expr.tree)
  val typ = expr.actualType.toString takeWhile '('.!=

  println(s"$exp: $BOLD$GREEN$typ$RESET")
  reify { (): Unit }
}

def desugar[T](expr: T): Unit = macro desugarImpl[T]
"""

// Do not exit sbt when Ctrl-C is used to stop a running app
cancelable in Global := true

showSuccess := true

showTiming := true

// Uncomment to enable offline mode
// offline := true

// Download and create Eclipse source attachments for library dependencies
// EclipseKeys.withSource := true

// Enable colors in Scala console (2.11.4+)
initialize ~= { _ =>
  val ansi = System.getProperty("sbt.log.noformat", "false") != "true"
  if (ansi) System.setProperty("scala.color", "true")
}

// Draw a separator between triggered runs (e.g, ~test)
triggeredMessage := { ws =>
  if (ws.count > 1) {
    val ls = System.lineSeparator * 2
    ls + "#" * 100 + ls
  } else ""
}

shellPrompt := { state =>
  import scala.Console.{BLUE, BOLD, RESET}
  s"$BLUE$BOLD${name.value}$RESET $BOLD\u25b6$RESET "
}
