require 'rails_helper'

RSpec.describe ResenasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/resenas').to route_to('resenas#index')
    end

    it 'routes to #new' do
      expect(get: '/resenas/new').to route_to('resenas#new')
    end

    it 'routes to #show' do
      expect(get: '/resenas/1').to route_to('resenas#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/resenas/1/edit').to route_to('resenas#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/resenas').to route_to('resenas#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/resenas/1').to route_to('resenas#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/resenas/1').to route_to('resenas#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/resenas/1').to route_to('resenas#destroy', id: '1')
    end
  end
end
