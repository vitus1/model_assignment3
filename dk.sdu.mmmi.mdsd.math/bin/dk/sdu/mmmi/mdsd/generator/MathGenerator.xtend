/*
 * generated by Xtext 2.25.0
 */
package dk.sdu.mmmi.mdsd.generator

import dk.sdu.mmmi.mdsd.math.Div
import dk.sdu.mmmi.mdsd.math.LetBinding
import dk.sdu.mmmi.mdsd.math.MathExp
import dk.sdu.mmmi.mdsd.math.MathNumber
import dk.sdu.mmmi.mdsd.math.Minus
import dk.sdu.mmmi.mdsd.math.Mult
import dk.sdu.mmmi.mdsd.math.Plus
import dk.sdu.mmmi.mdsd.math.VarBinding
import dk.sdu.mmmi.mdsd.math.VariableUse
import java.util.HashMap
import java.util.Map
import javax.swing.JOptionPane
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import dk.sdu.mmmi.mdsd.math.Program
import dk.sdu.mmmi.mdsd.math.Power
import dk.sdu.mmmi.mdsd.math.SquareRoot

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class MathGenerator extends AbstractGenerator {
	
	static Map<String, Integer> variables;

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		for (m : resource.allContents.toIterable.filter(Program)){
			resource.allContents.filter(MathExp).next.compute
			fsa.generateFile(
				"math_expression/" + m.program + ".java",
				m.compile)
		}
		//val math = resource.allContents.filter(MathExp).next
		//val result = math.compute
		//result.displayPanel
	}
	
	def compile (Program p) {
		'''
		package math_expression;
		public class ?p.program? {
		
		?FOR value : variables.entrySet?
		public int ?value.getKey?;
		?ENDFOR?
		
		?IF p.external !== null?
		private External external;
		
		public ?p.program?(External external)
		{
		    this.external = external;
		}
		?ENDIF?
		
		public void compute(){
			?FOR value : variables.entrySet?
				?value.getKey?=?value.getValue?;
			?ENDFOR?	
		}
		
		?IF p.external !== null?
		  public interface External {
		  	?IF p.external == 'pi()'?
		  		public int pi();
		  	?ENDIF?
		  	?IF p.external == 'sqrt(int)'?
		  		public int sqrt(int n);
		  	?ENDIF?
		  	?IF p.external == 'pow(int,int)'?
		  		public int pow(int n,int m);
		  	?ENDIF?
		  }
		?ENDIF?
		}
		'''
	}
		
	def void displayPanel(Map<String, Integer> result) {
		var resultString = ""
		for (entry : result.entrySet()) {
         	resultString += "var " + entry.getKey() + " = " + entry.getValue() + "\n"
        }
		
		JOptionPane.showMessageDialog(null, resultString ,"Math Language", JOptionPane.INFORMATION_MESSAGE)
	}
	
	def static compute(MathExp math) {
		variables = new HashMap()
		for(varBinding: math.variables)
			varBinding.computeExpression()
		variables
	}
	
	def static dispatch int computeExpression(VarBinding binding) {
		variables.put(binding.name, binding.expression.computeExpression())
		return variables.get(binding.name)
	}
	
	def static dispatch int computeExpression(MathNumber exp) {
		exp.value
	}

	def static dispatch int computeExpression(Plus exp) {
		exp.left.computeExpression + exp.right.computeExpression
	}
	
	def static dispatch int computeExpression(Minus exp) {
		exp.left.computeExpression - exp.right.computeExpression
	}
	
	def static dispatch int computeExpression(Mult exp) {
		exp.left.computeExpression * exp.right.computeExpression
	}
	
	def static dispatch int computeExpression(Div exp) {
		exp.left.computeExpression / exp.right.computeExpression
	}

	def static dispatch int computeExpression(LetBinding exp) {
		exp.body.computeExpression
	}

	def static dispatch int computeExpression(Power exp) {
		exp.n.computeExpression^exp.m.computeExpression
	}

	def static dispatch int computeExpression(SquareRoot exp) {
		exp.n.computeExpression
	}

	
	def static dispatch int computeExpression(VariableUse exp) {
		exp.ref.computeBinding
	}

	def static dispatch int computeBinding(VarBinding binding){
		if(!variables.containsKey(binding.name))
			binding.computeExpression()			
		variables.get(binding.name)
	}
	
	def static dispatch int computeBinding(LetBinding binding){
		binding.binding.computeExpression
	}
	
}
