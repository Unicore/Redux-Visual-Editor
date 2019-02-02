// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

struct StatesLinks {
    let links: [StatesList.State: [PropsList.Props]]
    
    static let initial = StatesLinks(links: [:])
}

func reduce(_ old: StatesLinks, with action: Action) -> StatesLinks {
    switch action {
        
    case let payload as AddStatePropsLink:
        var newLinks = old.links
        newLinks[payload.state] = newLinks[payload.state, default: []] + []
        return StatesLinks(links: newLinks)
        
    case let payload as DeleteStatePropsLink:
        var newLinks = old.links
        var newProps = newLinks[payload.state, default: []]
        newProps.removeAll(where: { $0 == payload.props })
        if newProps.count > 0 {
            newLinks[payload.state] = newProps
        } else {
            newLinks.removeValue(forKey: payload.state)
        }
        
        return StatesLinks(links: newLinks)
        
        
    default:
        return old
    }}


