/**
 * generated by Xtext 2.26.0
 */
package dk.sdu.mmmi.mdsd.math;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Power</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link dk.sdu.mmmi.mdsd.math.Power#getN <em>N</em>}</li>
 *   <li>{@link dk.sdu.mmmi.mdsd.math.Power#getM <em>M</em>}</li>
 * </ul>
 *
 * @see dk.sdu.mmmi.mdsd.math.MathPackage#getPower()
 * @model
 * @generated
 */
public interface Power extends Expression
{
  /**
   * Returns the value of the '<em><b>N</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the value of the '<em>N</em>' containment reference.
   * @see #setN(Expression)
   * @see dk.sdu.mmmi.mdsd.math.MathPackage#getPower_N()
   * @model containment="true"
   * @generated
   */
  Expression getN();

  /**
   * Sets the value of the '{@link dk.sdu.mmmi.mdsd.math.Power#getN <em>N</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>N</em>' containment reference.
   * @see #getN()
   * @generated
   */
  void setN(Expression value);

  /**
   * Returns the value of the '<em><b>M</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the value of the '<em>M</em>' containment reference.
   * @see #setM(Expression)
   * @see dk.sdu.mmmi.mdsd.math.MathPackage#getPower_M()
   * @model containment="true"
   * @generated
   */
  Expression getM();

  /**
   * Sets the value of the '{@link dk.sdu.mmmi.mdsd.math.Power#getM <em>M</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>M</em>' containment reference.
   * @see #getM()
   * @generated
   */
  void setM(Expression value);

} // Power
