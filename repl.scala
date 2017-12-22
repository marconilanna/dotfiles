import
  scala.annotation.{switch, tailrec}
, scala.beans.{BeanProperty, BooleanBeanProperty}
, scala.collection.JavaConverters._
, scala.collection.{breakOut, mutable}
, scala.concurrent.{Await, ExecutionContext, Future}
, scala.concurrent.ExecutionContext.Implicits.global
, scala.concurrent.duration._
, scala.language.experimental.macros
, scala.math._
, scala.reflect.macros.{blackbox, whitebox}
, scala.reflect.runtime.{currentMirror => mirror}
, scala.reflect.runtime.universe._
, scala.tools.reflect.ToolBox
, scala.util.{Failure, Random, Success, Try}
, scala.util.control.NonFatal
, java.io._
, java.net._
, java.nio.file._
, java.time.{Duration => jDuration, _}
, java.util.{Locale, UUID}
, java.util.regex.{Matcher, Pattern}
, System.{currentTimeMillis => now, nanoTime}

val toolbox = mirror.mkToolBox()

import toolbox.{PATTERNmode, TERMmode, TYPEmode}

def time[T](f: => T): T = {
  val start = now
  try f finally {
    println("Elapsed: " + (now - start)/1000.0 + " s")
  }
}

def desugar[T](expr: => T): Unit = macro desugarImpl[T]

def desugarImpl[T](c: blackbox.Context)(expr: c.Expr[T]) = {
  import c.universe._, scala.io.AnsiColor.{BOLD, GREEN, RESET}

  val exp = showCode(expr.tree)
  val typ = expr.actualType.toString takeWhile '('.!=

  println(s"$exp: $BOLD$GREEN$typ$RESET")

  q"()"
}
