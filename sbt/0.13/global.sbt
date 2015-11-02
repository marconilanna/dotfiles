// ~/.sbt/0.13/global.sbt

// Statements executed when starting the Scala REPL (sbt's `console` task)
initialCommands := """
import
  scala.annotation.{switch, tailrec}
, scala.beans.{BeanProperty, BooleanBeanProperty}
, scala.collection.JavaConverters._
, scala.collection.mutable
, scala.concurrent.{Await, Future}
, scala.concurrent.ExecutionContext.Implicits.global
, scala.concurrent.duration._
, scala.language.experimental.macros
, scala.reflect.macros.blackbox
, scala.util.{Failure, Random, Success, Try}
, scala.util.control.NonFatal
, System.{currentTimeMillis => now}
, System.nanoTime

def desugarImpl[T](c: blackbox.Context)(expr: c.Expr[T]): c.Expr[Unit] = {
  import c.universe._, scala.io.AnsiColor.{BOLD, GREEN, RESET}

  val exp = show(expr.tree)
  val typ = expr.actualType.toString takeWhile '('.!=

  println(s"$exp: $BOLD$GREEN$typ$RESET")
  reify { (): Unit }
}

def desugar[T](expr: T): Unit = macro desugarImpl[T]
"""

// Uncomment to enable offline mode for all projects
// offline := true

showSuccess := true

showTiming := true

// Enable colors in Scala console (2.11.4)
initialize ~= { _ =>
  val ansi = System.getProperty("sbt.log.noformat", "false") != "true"
  if (ansi) System.setProperty("scala.color", "true")
}

shellPrompt := { state =>
  import scala.Console.{BLUE, BOLD, RESET}
  val p = Project.extract(state)
  val name = p.getOpt(sbt.Keys.name) getOrElse p.currentProject.id
  s"$BLUE$BOLD$name$RESET $BOLD\u25b6$RESET "
}

net.virtualvoid.sbt.graph.Plugin.graphSettings

// Download and create Eclipse source attachments for library dependencies
// EclipseKeys.withSource := true
