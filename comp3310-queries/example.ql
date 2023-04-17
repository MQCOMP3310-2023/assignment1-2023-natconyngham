/**
 * @name Comp3310 Assignment 1
 * @kind problem
 * @problem.severity warning
 * @id java/example/print-statements
 */

 import java

 from MethodAccess callp, MethodAccess callm
 where
  (callp.getMethod().hasName("printStackTrace")
  and
  callp.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable")
  and
  callp.getNumArgument() = 0)
  or
  (callp.getMethod().hasName("println")
  and
  callp.getMethod().getDeclaringType().hasQualifiedName("java.io", "PrintStream")
  and
  callp.getAChildExpr*() = callm
  and
  callm.getMethod().hasName("getMessage")
  and
  callm.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable"))
 select callp, "This prints vulnerabilities to the terminal"