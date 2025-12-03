import { useDispatch, useSelector, useStore } from 'react-redux'
import type { AppDispatch, AppStore, RootState } from '../store'

export const useAppSelector = useSelector.withTypes<RootState>()