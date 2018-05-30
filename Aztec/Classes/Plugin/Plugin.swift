import Foundation

/// Plugin base class.  You can implement a subclass to customize some of the behavior in Aztec.
///
open class Plugin {
    
    public init() {}
    
    /// Method plugins can use to execute extra code when loaded.
    ///
    public func loaded() {}
    
    // MARK: - Input processing
    
    /// Processes an HTML string right before parsing it to convert it into a nodes tree in
    /// the input conversion process.
    ///
    open func process(inputHTML html: String) -> String { return html }
    
    /// Processes a nodes tree right after it's been parsed from a string, and before finalizing
    /// the input conversion process.
    ///
    open func process(inputHTMLTree tree: RootNode) { return }
    
    /// Returns a mapping of Element and their converters.  This will override the default
    /// mapping, so make sure to know what you're doing.
    ///
    /// - Important: when multiple plugins map the same elements, the last plugin to map it will be
    ///     the prevailing one.
    ///
    open func inputElementConverters() -> [Element: ElementConverter] { return [:] }
    
    /// Converts a paragraph property into the ElementNode that represents it.
    /// When a conversion is not implemented, just return nil.
    ///
    open func convert(_ paragraphProperty: ParagraphProperty) -> ElementNode? { return nil }
    
    // MARK: - Output Processing
    
    /// Processes an HTML string right after converting it from a nodes tree in the output
    /// conversion process.
    ///
    open func process(outputHTML html: String) -> String { return html }
    
    /// Processes a nodes tree right before it'll bee converted to a string, and before finalizing
    /// the output conversion process.
    ///
    open func process(outputHTMLTree tree: RootNode) { return }

    // MARK: - Equatable
    
    public static func ==(lhs: Plugin, rhs: Plugin) -> Bool {
        return type(of: lhs) == type(of: rhs)
    }
}
